#!/bin/sh

#  Vincent V. Toscano

# Pull templates
# git clone https://github.com/VincentVToscano/deploymentsAll.git ~/clone/deploymentsAll

# Run build
# . ~/clone/deploymentsAll/projectBuildScripts/projectBuildScript_0002.sh
YEAR=`date +'%Y'`

# Create build and Git deploy directories
mkdir -p ~/clone/www

# Copy template to all build directories
echo $HOME/clone/www/build.html | xargs -n 1 cp $HOME/clone/deploymentsAll/buildTemplates/build.tpl

# Point to src environments
HTML_5_SRC=~/clone

# Point to src environments
HTML_5_BUILD=~/clone/www

# Create reference to build.html
BUILD_PAGE=~/clone/www/build.html

# Update year
echo $BUILD_PAGE | xargs -n 1 sed -i -e "s:CURRENT_YEAR:$YEAR:"

# Source NVM
. ~/.nvm/nvm.sh

# Install lock version Node.js and latest NPM
nvm install v4.2.4
nvm use v4.2.4
#npm install -g npm@latest

case "$CI_BRANCH" in
    dev)
    # Build HTML_5_build
        cd $HTML_5_SRC
        npm cache clean && npm install
        echo "<div>&#x2592;&#x2592;&#x2592;&nbsp;&nbsp;&nbsp;&nbsp;HTML_5_build&nbsp;&nbsp;&nbsp;&nbsp;&#x2592;&#x2592;&#x2592;</div><h1>Gulp Build</h1><pre>" >> ${BUILD_PAGE}
        gulp >> ${BUILD_PAGE}
        echo '</pre>' >> ${BUILD_PAGE}
        echo '<h1>Files and Directories</h1><pre class="sm">' >> ${BUILD_PAGE}
        (find * 2>&1) >> ${BUILD_PAGE}
        echo '</pre>' >> ${BUILD_PAGE}
        cd $HTML_5_BUILD
        echo '<h1>Build and Directories</h1><pre class="sm">' >> ${BUILD_PAGE}
        (find * 2>&1) >> ${BUILD_PAGE}
        echo '</pre></body></html>' >> $BUILD_PAGE
        sed -i -e "s:CI_BUILD_NUMBER:$CI_BUILD_NUMBER:" -e "s:CI_COMMIT_ID:$CI_COMMIT_ID:" -e "s:CI_BRANCH:$CI_BRANCH:" -e "s:CI_COMMITTER_NAME:$CI_COMMITTER_NAME:" ${BUILD_PAGE}
        echo $CI_MESSAGE
        CI_MESSAGE=$(echo $CI_MESSAGE | sed 's/ /LLL/g')
        echo $CI_MESSAGE
        sed -i "s:CI_MESSAGE:$CI_MESSAGE:" ${BUILD_PAGE} || sed -i "s:CI_MESSAGE:Merge:" ${BUILD_PAGE}
        sed -i "s:LLL: :g" ${BUILD_PAGE}
    ;;
    stage)

        cd $HTML_5_SRC
        npm cache clean && npm install
        echo "<div>&#x2592;&#x2592;&#x2592;&nbsp;&nbsp;&nbsp;&nbsp;HTML_5_build&nbsp;&nbsp;&nbsp;&nbsp;&#x2592;&#x2592;&#x2592;</div><h1>Gulp Build</h1><pre>" >> ${BUILD_PAGE}
        gulp >> ${BUILD_PAGE}
        echo '</pre>' >> ${BUILD_PAGE}
        echo '<h1>Files and Directories</h1><pre class="sm">' >> ${BUILD_PAGE}
        (find * 2>&1) >> ${BUILD_PAGE}
        echo '</pre>' >> ${BUILD_PAGE}
        cd $HTML_5_BUILD
        echo '<h1>Build and Directories</h1><pre class="sm">' >> ${BUILD_PAGE}
        (find * 2>&1) >> ${BUILD_PAGE}
        echo '</pre></body></html>' >> $BUILD_PAGE
        sed -i -e "s:CI_BUILD_NUMBER:$CI_BUILD_NUMBER:" -e "s:CI_COMMIT_ID:$CI_COMMIT_ID:" -e "s:CI_BRANCH:$CI_BRANCH:" -e "s:CI_COMMITTER_NAME:$CI_COMMITTER_NAME:" ${BUILD_PAGE}
        echo $CI_MESSAGE
        CI_MESSAGE=$(echo $CI_MESSAGE | sed 's/ /LLL/g')
        echo $CI_MESSAGE
        sed -i "s:CI_MESSAGE:$CI_MESSAGE:" ${BUILD_PAGE} || sed -i "s:CI_MESSAGE:Merge:" ${BUILD_PAGE}
        sed -i "s:LLL: :g" ${BUILD_PAGE}
    ;;
    master)

        cd $HTML_5_SRC
        npm cache clean && npm install
        echo "<div>&#x2592;&#x2592;&#x2592;&nbsp;&nbsp;&nbsp;&nbsp;HTML_5_build&nbsp;&nbsp;&nbsp;&nbsp;&#x2592;&#x2592;&#x2592;</div><h1>Gulp Build</h1><pre>" >> ${BUILD_PAGE}
        gulp --production >> ${BUILD_PAGE}
        echo '</pre>' >> ${BUILD_PAGE}
        echo '<h1>Files and Directories</h1><pre class="sm">' >> ${BUILD_PAGE}
        (find * 2>&1) >> ${BUILD_PAGE}
        echo '</pre>' >> ${BUILD_PAGE}
        cd $HTML_5_BUILD
        echo '<h1>Build and Directories</h1><pre class="sm">' >> ${BUILD_PAGE}
        (find * 2>&1) >> ${BUILD_PAGE}
        echo '</pre></body></html>' >> $BUILD_PAGE
        sed -i -e "s:CI_BUILD_NUMBER:$CI_BUILD_NUMBER:" -e "s:CI_COMMIT_ID:$CI_COMMIT_ID:" -e "s:CI_BRANCH:$CI_BRANCH:" -e "s:CI_COMMITTER_NAME:$CI_COMMITTER_NAME:" ${BUILD_PAGE}
        echo $CI_MESSAGE
        CI_MESSAGE=$(echo $CI_MESSAGE | sed 's/ /LLL/g')
        echo $CI_MESSAGE
        sed -i "s:CI_MESSAGE:$CI_MESSAGE:" ${BUILD_PAGE} || sed -i "s:CI_MESSAGE:Merge:" ${BUILD_PAGE}
        sed -i "s:LLL: :g" ${BUILD_PAGE}
    ;;
    special)
        echo -n "fallthrough"
    ;&
    fallthrough)
        echo "default"
    ;;
esac