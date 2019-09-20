vimrc
=====

My .vimrc 

Do all git and git submodule work from ~/vimrc

Installing a plugin:
git submodule add https://github.com/<repo>/<plugin>
git .vim/pack/plugins/start/<pluginname>
git add .
git commit -m "installing <pluginname> as submodule"

Update all the plugins:
git submodule foreach git pull origin master
git commit -am "Updated plugins."

Removing a plugin:
git submodule deinit .vim/pack/plugins/start/<pluginname>
git rm -r .vim/pack/plugins/start/<pluginname>
rm -r .git/modules/.vim/pack/plugins/start/<pluginname>

Updating a plugin:
cd .vim/pack/plugins/start/<pluginname>
git pull origin master

Putting it on new machine:
git clone --recursive https://github.com/<username>/<reponame>.git

On a working machine, to get updates:
git pull
git submodule update

instructions based on readme from : https://gist.github.com/keeganstreet/923900/13504e9b05cb131d55d8db817f093045b834d8de
