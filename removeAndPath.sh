#!/bin/bash

# needed patches of mostly static nature
git cherry-pick 401ecea99b4d852b155464ed722d70ce376d4280
git cherry-pick d2d5c94deede383f89aa2d959cb9b5d2e93ff6a6
git cherry-pick cbb1524efc0273a48710448d84fd95c6c05cab36
git cherry-pick 5c922196e852ce64c1e73309887b2eda2bd187a3
# git cherry-pick f075348f28a9f9cdb842aac09dcaecc1d3be9956
git cherry-pick 7e2187f62fe54f5df70812822fbd2b4114b96bca

# find theme -name *.html | xargs -I% bash -c "sed -i -e '/<link href=\"https:\/\/fonts.googleapis.com\" rel=\"preconnect\">\|<link href=\"https:\/\/fonts.gstatic.com\" rel=\"preconnect\" crossorigin=\"anonymous\">\|<script src=\"https:\/\/ajax.googleapis.com\/ajax\/libs\/webfont\/1.6.26\/webfont.js\" type=\"text\/javascript\"><\/script>\|<script type=\"text\/javascript\">WebFont.load(.*);<\/script>/d' % && sed -i 's/<meta content=\"Webflow\" name=\"generator\">/<meta property=\"og:image:type\" content=\"image\/jpeg\">\n<meta property=\"og:image:height\" content=\"500\">\n<meta property=\"og:image:width\" content=\"500\">\n<meta property=\"og:site_name\" content=\"WX-ONE\">\n<meta property=\"og:url\" content=\"https:\/\/pre.wx1.de\">\n<meta content=\"https:\/\/pre.wx1.de\/assets\/images\/WX-One_og.jpeg\" property=\"og:image\">\n<meta content=\"https:\/\/pre.wx1.de\/assets\/images\/WX-One_og.jpeg\" property=\"twitter:image\">/' %"
