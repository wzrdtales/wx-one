#!/bin/bash

# needed patches of mostly static nature
git cherry-pick 401ecea99b4d852b155464ed722d70ce376d4280
git cherry-pick d2d5c94deede383f89aa2d959cb9b5d2e93ff6a6
git cherry-pick cbb1524efc0273a48710448d84fd95c6c05cab36
git cherry-pick 5c922196e852ce64c1e73309887b2eda2bd187a3
git cherry-pick 7e2187f62fe54f5df70812822fbd2b4114b96bca
# seo logic
git cherry-pick 882a7cf34d11976aae7d5483aab3a48243471d32
git cherry-pick f9e4c88f3c547607c7223147715cbc14b364ec36
# git cherry-pick 46e46ebca1c8d0da5bd226f057f6e0826352fd92
# sometimes fails
git cherry-pick 6ded9b5a554263f1511aa1e1fafcebd44ae7d4c2

# find theme -name *.html | xargs -I% bash -c "sed -i -e '/<link href=\"https:\/\/fonts.googleapis.com\" rel=\"preconnect\">\|<link href=\"https:\/\/fonts.gstatic.com\" rel=\"preconnect\" crossorigin=\"anonymous\">\|<script src=\"https:\/\/ajax.googleapis.com\/ajax\/libs\/webfont\/1.6.26\/webfont.js\" type=\"text\/javascript\"><\/script>\|<script type=\"text\/javascript\">WebFont.load(.*);<\/script>/d' % && sed -i 's/<meta content=\"Webflow\" name=\"generator\">/<meta property=\"og:image:type\" content=\"image\/jpeg\">\n<meta property=\"og:image:height\" content=\"500\">\n<meta property=\"og:image:width\" content=\"500\">\n<meta property=\"og:site_name\" content=\"WX-ONE\">\n<meta property=\"og:url\" content=\"https:\/\/pre.wx1.de\">\n<meta content=\"https:\/\/pre.wx1.de\/assets\/images\/WX-One_og.jpeg\" property=\"og:image\">\n<meta content=\"https:\/\/pre.wx1.de\/assets\/images\/WX-One_og.jpeg\" property=\"twitter:image\">/' %"
