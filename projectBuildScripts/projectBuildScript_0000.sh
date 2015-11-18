#!/bin/sh

#  Vincent V. Toscano

# Pull templates
# git clone https://github.com/VincentVToscano/deploymentsAll.git ~/clone/deploymentsAll

# Run build
# . ~/clone/deploymentsAll/projectBuildScripts/projectBuildScript_0000.sh

YEAR=`date +'%Y'`

# Create build and Git deploy directories
mkdir -p ~/clone/HTML_5_build && mkdir -p ~/clone/XHTML_1_Transitional_build

# Copy template all build directories
echo $HOME/clone/HTML_5_build/build.html $HOME/clone/XHTML_1_Transitional_build/build.html | xargs -n 1 cp $HOME/clone/deploymentsAll/buildTemplates/build.tpl

# Point to src environments
HTML_5_SRC=~/clone/HTML_5_src
XHTML_1_SRC=~/clone/XHTML_1_Transitional_src

# Point to src environments
HTML_5_BUILD=~/clone/HTML_5_build
XHTML_1_BUILD=~/clone/XHTML_1_Transitional_build

# Create reference to build.html
BUILD_PAGE=~/clone/HTML_5_build/build.html
BUILD_PAGE2=~/clone/XHTML_1_Transitional_build/build.html

# Update year
echo $BUILD_PAGE $BUILD_PAGE2 | xargs -n 1 sed -i -e "s:CURRENT_YEAR:$YEAR:"

# Source NVM
. ~/.nvm/nvm.sh

# Install lock version Node.js and latest NPM
nvm install v4.2.2
nvm use v4.2.2
#npm install -g npm@latest

case "$CI_BRANCH" in
	dev)
	# Build HTML_5_build
		cd $HTML_5_SRC
		npm cache clean && npm install
		echo "<div>&#x2592;&#x2592;&#x2592;&nbsp;&nbsp;&nbsp;&nbsp;HTML_5_build&nbsp;&nbsp;&nbsp;&nbsp;&#x2592;&#x2592;&#x2592;</div><h1>Gulp Build</h1><pre>" >> ${BUILD_PAGE}
		sh buildPages.sh 2>&1 >> ${BUILD_PAGE}
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

	# Build XHTML_1_Transitional_build
		cd $XHTML_1_SRC
		npm cache clean && npm install
		echo "<div>&#x2592;&#x2592;&#x2592;&nbsp;&nbsp;&nbsp;&nbsp;XHTML_1_Transitional_build&nbsp;&nbsp;&nbsp;&nbsp;&#x2592;&#x2592;&#x2592;</div><h1>Gulp Build</h1><pre>" >> ${BUILD_PAGE2}
		sh buildPages.sh 2>&1 >> ${BUILD_PAGE2}
		echo '</pre>' >> ${BUILD_PAGE2}
		echo '<h1>Src Files and Directories</h1><pre class="sm">' >> ${BUILD_PAGE2}
		(find * 2>&1) >> ${BUILD_PAGE2}
		echo '</pre>' >> ${BUILD_PAGE2}
		cd $XHTML_1_BUILD
		echo '<h1>Build and Directories</h1><pre class="sm">' >> ${BUILD_PAGE2}
		(find * 2>&1) >> ${BUILD_PAGE2}
		echo '</pre></body></html>' >> $BUILD_PAGE2
		sed -i -e "s:CI_BUILD_NUMBER:$CI_BUILD_NUMBER:" -e "s:CI_COMMIT_ID:$CI_COMMIT_ID:" -e "s:CI_BRANCH:$CI_BRANCH:" -e "s:CI_COMMITTER_NAME:$CI_COMMITTER_NAME:" ${BUILD_PAGE2}
		echo $CI_MESSAGE
		CI_MESSAGE=$(echo $CI_MESSAGE | sed 's/ /LLL/g')
		echo $CI_MESSAGE
		sed -i "s:CI_MESSAGE:$CI_MESSAGE:" ${BUILD_PAGE2} || sed -i "s:CI_MESSAGE:Merge:" ${BUILD_PAGE2}
		sed -i "s:LLL: :g" ${BUILD_PAGE2}

	;;

	stage | master)
	# Build HTML_5_build
		echo "STAGING BUILD STARTED"
		cd $HTML_5_SRC
		npm cache clean && npm install
		echo "<div>&#x2592;&#x2592;&#x2592;&nbsp;&nbsp;&nbsp;&nbsp;HTML_5_build&nbsp;&nbsp;&nbsp;&nbsp;&#x2592;&#x2592;&#x2592;</div><h1>Gulp Build</h1><pre>" >> ${BUILD_PAGE}
		sh buildPages.sh stage 2>&1 >> ${BUILD_PAGE}
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

		# Build XHTML_1_Transitional_build
		cd $XHTML_1_SRC
		npm cache clean && npm install
		echo "<div>&#x2592;&#x2592;&#x2592;&nbsp;&nbsp;&nbsp;&nbsp;XHTML_1_Transitional_build&nbsp;&nbsp;&nbsp;&nbsp;&#x2592;&#x2592;&#x2592;</div><h1>Gulp Build</h1><pre>" >> ${BUILD_PAGE2}
		sh buildPages.sh 2>&1 >> ${BUILD_PAGE2}
		echo '</pre>' >> ${BUILD_PAGE2}
		echo '<h1>Src Files and Directories</h1><pre class="sm">' >> ${BUILD_PAGE2}
		(find * 2>&1) >> ${BUILD_PAGE2}
		echo '</pre>' >> ${BUILD_PAGE2}
		cd $XHTML_1_BUILD
		echo '<h1>Build and Directories</h1><pre class="sm">' >> ${BUILD_PAGE2}
		(find * 2>&1) >> ${BUILD_PAGE2}
		echo '</pre></body></html>' >> $BUILD_PAGE2
		sed -i -e "s:CI_BUILD_NUMBER:$CI_BUILD_NUMBER:" -e "s:CI_COMMIT_ID:$CI_COMMIT_ID:" -e "s:CI_BRANCH:$CI_BRANCH:" -e "s:CI_COMMITTER_NAME:$CI_COMMITTER_NAME:" ${BUILD_PAGE2}
		echo $CI_MESSAGE
		CI_MESSAGE=$(echo $CI_MESSAGE | sed 's/ /LLL/g')
		echo $CI_MESSAGE
		sed -i "s:CI_MESSAGE:$CI_MESSAGE:" ${BUILD_PAGE2} || sed -i "s:CI_MESSAGE:Merge:" ${BUILD_PAGE2}
		sed -i "s:LLL: :g" ${BUILD_PAGE2}

		# Change forwarding in .htaccess
		#sed -i "s:dev.t:stage.t:g" "$HTML_5_BUILD"/.htaccess
		#sed -i "s:dev.t:stage.t:g" "$XHTML_1_BUILD"/.htaccess
		sed -i "s:dunbar-dev.toolofnadrive.com:stage.dunbararmored.dynamic.li:g" "$HTML_5_BUILD"/.htaccess
		sed -i "s:dunbar-dev.toolofnadrive.com:stage.dunbararmored.dynamic.li:g" "$XHTML_1_BUILD"/.htaccess
	;;

	special)
		echo -n "fallthrough"
		;&
	fallthrough)
		echo "default"
		;;
esac