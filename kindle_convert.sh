#!/bin/bash

if [ $# -eq 0 ]; then
    echo "No arguments provided"
    exit 1
fi

#URL="https://medium.com/palantir/code-review-best-practices-19e02780015f"
URL=$1


TITLE=`curl $URL |tidy -q -c -b -omit -w 0 | grep -i "<title" | hxselect -s '\n' -c  'title' `


curl -o output.html --data-urlencode "extractor=ArticleExtractor" --data-urlencode "output=htmlFragment" --data-urlencode "url=$URL" http://boilerpipe-web.appspot.com/extract

tidy -q -c -b -omit  -o cleared.html -i  output.html

BOOK_ID=`date +%s`

ebook-convert  cleared.html $BOOK_ID.mobi --title "$TITLE"

rm output.html cleared.html

KINDLE_PATH="/media/koukis/Kindle/documents/Downloads/articles/"

cp $BOOK_ID.mobi $KINDLE_PATH

echo $URL
echo $TITLE
