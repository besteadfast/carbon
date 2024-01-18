# Creating a new project from boilerplate

1. Use this repo as a template to create a new repository
1. Clone `.env.local` to `.env`
1. Delete the `.gitignore` and replace with `.gitignore.example` (by renaming the latter)
1. Run `ddev start`
1. Run `ddev import-db --src="seed.sql"`
1. Run `ddev composer install`
1. Run `ddev craft setup/security-key`
1. Run `yarn add`
1. Run `yarn dev`
1. Profit?
