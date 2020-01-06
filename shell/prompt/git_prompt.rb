#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

# The methods that get called more than once are memoized.

# original:
# https://github.com/benhoskings/dot-files/blob/master/files/bin/git_cwd_info

require_relative "colors_prompt"
def git_repo_path
  @git_repo_path ||= `git rev-parse --git-dir 2>/dev/null`.strip
end

def in_git_repo
  !git_repo_path.empty? &&
  git_repo_path != '~' &&
  git_repo_path != '.' &&
  git_repo_path != "#{ENV['HOME']}/.git"
end

def in_bare_repo
  `git rev-parse --is-inside-git-dir 2>/dev/null`.strip == "true" ? true : false
end

def git_parse_branch
  branch = `git rev-parse --abbrev-ref HEAD 2>/dev/null`.strip
  if branch == "HEAD"
    is_tag = `git describe --tag 2>/dev/null`.strip
    if is_tag.length > 0
      is_tag
    else
      "no branch"
    end
  else
    branch
  end
  # @git_parse_branch ||= File.read("#{git_repo_path}/HEAD").strip.scan(/(?:refs\/heads\/)(.*)$/).first.first
end

def git_head_commit_id
  `git rev-parse --short HEAD 2>/dev/null`.strip
end

def git_cwd_dirty
  " ✗" unless git_repo_path == '.' || `git ls-files -m 2>/dev/null`.strip.empty?
end

def git_commit_count
  st = `git status 2>/dev/null`.scan(/(behind|ahead).+ by (\d+)/)
  if not st.empty?
    direction = "→"
    direction = "←" if st.first.first == "behind"
    " %d%s" % [st.first[1], direction]
  end
end

def git_untracked_files
  " +" unless `git status 2>/dev/null`.scan(/Untracked files/).empty?
end

def rebasing_etc
  if File.exists?(File.join(git_repo_path, 'BISECT_LOG'))
    "+bisect"
  elsif File.exists?(File.join(git_repo_path, 'MERGE_HEAD'))
    "+merge"
  elsif %w[rebase rebase-apply rebase-merge ../.dotest].any? {|d| File.exists?(File.join(git_repo_path, d)) }
    "+rebase"
  end
end

if in_git_repo
  puts "[\
git:\
#{$COLOR_RED}#{git_parse_branch}#{$COLOR_RESET}#{$COLOR_WHITE}@#{$COLOR_RESET}#{$COLOR_BLUE}#{git_head_commit_id}#{$COLOR_RESET}\
#{rebasing_etc}\
#{$COLOR_GREEN_I}#{git_cwd_dirty}#{$COLOR_RESET}\
#{$COLOR_CYAN}#{git_untracked_files}#{$COLOR_RESET}\
#{$COLOR_WHITE}#{git_commit_count}#{$COLOR_RESET}\
]"
end

if in_bare_repo
  bare_type = `git rev-parse --is-bare-repository 2>/dev/null`.strip == "true" ? "BARE" : "GIT_DIR"
  puts "[\
git:#{$COLOR_RED}#{bare_type}#{$COLOR_RESET}\
]"
end