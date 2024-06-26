#!/bin/bash

./bin/search_and_replace.sh public\/blog "\/wp\-content" "https\:\/\/pages\.near\.org\/wp\-content"
./bin/search_and_replace.sh public\/blog "\=\"\/wp\-content" "\=\"https\:\/\/pages\.near\.org\/wp-content"
./bin/search_and_replace.sh public\/blog "\/wp\-includes" "https\:\/\/pages\.near\.org\/wp\-includes"
./bin/search_and_replace.sh public\/blog "\?paged\=" "page\/"
./bin/search_and_replace.sh public\/blog\/near-foundation-announces-policy-principles "\=https\:\/\/s3\-eu\-west\-2\.amazonaws\.com\/lawcom\-prod\-storage\-11jsxou24uy7q\/uploads\/2022\/07\/Digital\-Assets\-Consultation\-Paper\-Law\-Commission\-1\.pdf" ""