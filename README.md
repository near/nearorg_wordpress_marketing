# nearorg_marketing

This repo contains static html blog files which are automatically committed to the develop branch of this repo when the [Simply Static Wordpress plugin](https://pages.near.org/wp-admin/admin.php?page=simply-static-generate) is used to `Generate Static Files`. 


## To sync blog content from pages.near.org to near.org
1. Log into [WordPress Admin](https://pages.near.org/wp-admin/admin.php?page=simply-static-generate), go to the Simply Static plugin towards the bottom of the left-side nav, and click `Generate Static Files`

    1. Sometimes that github export takes > 2 hours, or fails completely, and one must update the wordpress plugin via `Settings` -> `Deploy` and select `Zip Archive` instead of `Github`. Then, once the export completes, `Tools` -> `Activity Log` will display a URL to download the created zip file. Then the following manual steps are required: 

    2. unzip the zip file and copy the content of `blog/` into this repository at `public/blog`

    3. create a PR and merge those changes into the `develop` branch

2. Verify the develop branch UI works as expected [on the nearorg preview environment](https://nearorg-marketing.vercel.app/blog) 
3. If the above UI looks good, open a PR to merge the `develop` branch into `main`


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
