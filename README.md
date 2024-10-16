# nearorg_marketing

This repo contains static html blog files which are automatically committed to the develop branch of this repo when the [Simply Static Wordpress plugin](https://pages.near.org/wp-admin/admin.php?page=simply-static-generate) is used to `Generate Static Files`. 


## To sync blog content from pages.near.org to near.org
1. Log into [WordPress Admin](https://pages.near.org/wp-admin/admin.php?page=simply-static-generate), go to the Simply Static plugin towards the bottom of the left-side nav, and click `Generate Static Files`

    1. Sometimes that github export takes > 2 hours, or fails completely, and one must update the wordpress plugin via `Settings` -> `Deploy` and select `Zip Archive` instead of `Github`. Then, once the export completes, `Tools` -> `Activity Log` will display a URL to download the created zip file. Then the following manual steps are required: 

    2. unzip the zip file and copy the content of `blog/` into this repository at `public/blog`

    3. create a PR and merge those changes into the `develop` branch

2. Verify the develop branch UI works as expected [on the nearorg preview environment](https://nearorg-marketing.vercel.app/blog). 
3. Be sure to click into a couple blog posts, naviate using the paginated links, and if the UI looks good, open a PR to merge the `develop` branch into `main`.


## A note on paginated links. 
The `1,2,3...` page links towards the bottom of the UI are served from the repo that drives [dev.near.org](https://github.com/near/nearorg). These should be manually updated periodically, perhaps once a month, by copying into `nearorg/public/blog` the `category`, `page`, and `tag` directories from the wordpress export and running `./bin/replace_all.sh` as was done is [this reference PR](https://github.com/near/nearorg/commit/4fb44d4d58c5e7a1322fd115a72faca6a98d59ba). It shouldn't be necessary to update this as often as new blogs are added because it's most important that direct links to blogs like `https://near.org/blog/hot-new-alpha` are working than to have each paginated link show every blog. **NOTE**: When running this on your local mac, you'll need to comment out line 25 [here](https://github.com/near/nearorg/blob/32b561af987ce7b66b9c92385cf93bee966a773a/bin/search_and_replace.sh#L25) and uncomment line 28


## Automated Search and Replace
Upon merges into the develop branch, a Github Actions runs `/bin/replace_all.sh` to automate the search & replace of the below strings. This allows us to leverage pages.near.org to serve high bandwidth content, like large images and videos, thereby reducing the load on the Vercel servers which render near.org. This means that the 3 servers of pages.near.org, Github, and near.org are used to render blogs at near.org/blog.

```search: /wp-content
replace: https://pages.near.org/wp-content

search: ="/wp-content
replace: ="https://pages.near.org/wp-content

search: /wp-includes
replace: https://pages.near.org/wp-includes

search: ?paged=
replace: page/

From the file blog/near-foundation-announces-policy-principles/index.html
delete "https://s3-eu-west-2.amazonaws.com/lawcom-prod-storage-11jsxou24uy7q/uploads/2022/07/Digital-Assets-Consultation-Paper-Law-Commission-1.pdf"```
