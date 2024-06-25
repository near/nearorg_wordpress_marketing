# nearorg_marketing

This repo contains static html blog files which are automatically committed to the develop branch of this repo when the [Simply Static plugin](https://pages.near.org/wp-admin/admin.php?page=simply-static-generate) is used to `Generate Static Files`. 

Sometimes that github export takes > 2 hours, or fails completely, and one must update the wordpress plugin via `Settings` -> `Deploy` and select `Zip Archive` instead of `Github`. Then, once the export completes, `Tools` -> `Activity Log` will display a URL to download the created zip file. Then the following manual steps are required: 

1. unzip the zip file and copy the content of `blog/` into this repository at `public/blog`
2. create a PR and merge those changes into the `develop` branch
3. Verify the develop branch UI works as expected @ [test.near.org/blog](https://test.near.org/blog) 
4. If the above UI looks good, open a PR to merge the `develop` branch into `main`


`/bin/replace_all.sh` automates the search & replace of the following strings: 
search: /wp-content
replace: https://pages.near.org/wp-content

search: /wp-includes
replace: https://pages.near.org/wp-includes

search: " /wp-content"
replace: " https://pages.near.org/wp-content"

search: ="/wp-content
replace: ="https://pages.near.org/wp-content

search: =/wp-content
replace: =https://pages.near.org/wp-content

search: ?paged=
replace: page/

From the file blog/near-foundation-announces-policy-principles/index.html
delete "https://s3-eu-west-2.amazonaws.com/lawcom-prod-storage-11jsxou24uy7q/uploads/2022/07/Digital-Assets-Consultation-Paper-Law-Commission-1.pdf"
