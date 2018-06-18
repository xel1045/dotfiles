<?php

function get_config($key, $default = null)
{
	return trim(shell_exec('dot-config --get '. $key)) ?: $default;
}

function info($message, $exit = false)
{
	echo $message . PHP_EOL;

	if ($exit) {
		exit(1);
	}
}

function dd($value)
{
	var_dump($value);
	exit;
}
