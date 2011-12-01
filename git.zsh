git_check_if_worktree() {
# This function intend to be only executed in chpwd().
# Check if the current path is in git repo.

# We would want stop this function, on some big git repos it can take some time to cd into.
if [ -n "${skip_zsh_git}" ]; then
git_pwd_is_worktree='false'
return 1
fi
# The : separated list of paths where we will run check for git repo.
# If not set, then we will do it only for /root and /home.
git_check_if_workdir_path="${git_check_if_workdir_path:-/root:/home}"
for i in ${=git_check_if_workdir_path//:/ }; do
if [[ "${PWD}" =~ "^${i}" ]]; then
local git_pwd_is_worktree_match='true'
break
fi
done
if ! [ "${git_pwd_is_worktree_match}" = 'true' ]; then
git_pwd_is_worktree='false'
return 1
fi

# todo: Prevent checking for /.git or /home/.git, if PWD=/home or PWD=/ maybe...
# damn annoying RBAC messages about Access denied there.
if [ -d '.git' ] || git rev-parse --is-inside-work-tree > /dev/null 2>&1; then
git_pwd_is_worktree='true'
git_worktree_is_bare="$(git config core.bare)"
else
unset git_branch git_worktree_is_bare
git_pwd_is_worktree='false'
fi
}

git_branch() {
git_branch="$(git symbolic-ref HEAD 2>/dev/null)"
git_branch="${git_branch##*/}"
git_branch="${git_branch:-no branch}"
}

git_dirty() {
#if [ "${git_worktree_is_bare}" = 'false' ] && [ -n "$(git status --untracked-files='no' --porcelain)" ]; then
if [ "${git_worktree_is_bare}" = 'false' ] && [ -n "$(git status)" ]; then
git_dirty='%F{green}*'
else
unset git_dirty
fi
}

precmd() {
# Set terminal title.
termtitle precmd

if [ "${git_pwd_is_worktree}" = 'true' ]; then
git_branch
git_dirty

git_prompt=" %F{blue}[%F{253}${git_branch}${git_dirty}%F{blue}]"
else
unset git_prompt
fi
}
