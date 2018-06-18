#!/usr/bin/php
<?php

$projects_path = '/Users/xel/Documents/Projets';
$desktop_path  = '/Users/xel/Desktop';
$archives_path = '/Users/xel/Backups/Projets';
$archive_after = 5;

//==============================================================================

$projects_path = realpath($projects_path).'/';
$desktop_path  = realpath($desktop_path).'/';
$archives_path = realpath($archives_path).'/';


set_time_limit(0);
date_default_timezone_set('America/Montreal');
setlocale(LC_ALL, 'fr_CA');

$months_names = array('Janvier', 'Fevrier', 'Mars', 'Avril', 'Mai', 'Juin',
	'Juillet', 'Aout', 'Septembre', 'Octobre', 'Novembre', 'Decembre');


// Création du mois actuelle de sauvegarde de fichier si ce dernier n'a pas déjà
// été crée.
$actual = ucwords(strftime('%Y %B'));

if ( ! file_exists($projects_path.$actual)) {
	echo 'Creating project folder '.$actual.PHP_EOL;
	mkdir($projects_path.$actual);

	$desktop_name = ucwords(strftime('%B %Y'));
	symlink($projects_path.$actual, $desktop_path.$desktop_name);
}


// Archivage des vieux dossiers de sauvegarde par mois
if ($archives_path && $dh = opendir($projects_path)) {
	while (($file = readdir($dh)) !== false) {
		// On s'assure qu'il s'agit d'un dossier au format 2XXX Mois
		if (!preg_match('/^(2\d{3}) (.+)$/', $file, $matches)) {
			continue;
		}

		$year = $matches[1];
		$month_name = preg_replace('/[^A-Za-z]/', '', $matches[2]);

		// Est-ce qu'on est en mesure d'identifier le mois?
		if ( ! in_array($month_name, $months_names)) {
			continue;
		}

		$month = array_search($month_name, $months_names)+1;

		$time = mktime(0, 0, 0, $month, 1, $year);
		$interval = floor((time() - $time) / 2629744);

		if ($interval > $archive_after) {
			shell_exec('mv "'.$projects_path.$file.'" "'.$archives_path.$file.'"');
		}

		$desktop_name = ucwords(strftime('%B %Y', $time));

		if ($interval > 0 && file_exists($desktop_path.$desktop_name)) {
			unlink($desktop_path.$desktop_name);
		}
	}

	closedir($dh);
}
