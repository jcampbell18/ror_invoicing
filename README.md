# Invoicing System

## Specifications

### System

- [x] Windows 10 OS
    - [x] Windows Subsystem Linux (WSL2) Ubuntu 20.04
    
### IDE

- [x] JetBrain's RubyMine v2020.3.1

### Project

- [x] Ruby v2.7.2
- [x] Rails v6.1.1
- [x] MYSQL v8.0.22
- [x] VueJS v2.6.12

## Documentation

### Initialize Project

- create project (automatically run from RubyMine)
    - `rails _6.1.1_ new ror_invocing --webpack=vue --skip --database=mysql`
    - ![screenshot](https://github.com/jcampbell18/ror_invoicing/blob/master/Screenshot%202021-01-11%20074541.png)
    - ![screenshot](https://github.com/jcampbell18/ror_invoicing/blob/master/Screenshot%202021-01-11%20074601.png)
    
- update/install (type in terminal) 
    - gems unable to automatically run because of Windows/WSL2 system
        - `bundle install`
        - `rails webpacker:install`
        - `rails webpacker:install:vue`
    - ![screenshot](https://github.com/jcampbell18/ror_invoicing/blob/master/Screenshot%202021-01-11%20084941.png)
  
- edit file: `config/database.yml`
    - update password
  
- make sure mysql server is running
    - `sudo service mysql start`
  
- create database
    - `rails db:create`
    - `rails db:migrate`

### Backend

#### Scaffold

- creates controller, model, view, and updates routes
    - tables without foreign keys
      - `rails g scaffold States name:string{75} abbreviation:string{4}`
      - `rails db:migrate`
        
      - `rails g scaffold BidStatuses name:string{20}`
      - `rails db:migrate`
        
      - `rails g scaffold AccessLevels name:string{50} description:string{250}`
      - `rails db:migrate`
        
      - `rails g scaffold CompanyCategories name:string{50}`
      - `rails db:migrate`
        
      - `rails g scaffold ExpenseCategories name:string{50} description:string{250}`
      - `rails db:migrate`
        
      - `rails g scaffold Vehicles man_year:date make:string{50} model:string{50} submodel:string{50} engine:string{50} notes:string{150}`
      - `rails db:migrate`
        
      - `rails g scaffold Skus name:string{50} description:string{250}`
      - `rails db:migrate`
        
      - `rails g scaffold Terms name:string{150}`
      - `rails db:migrate`
        
      - `rails g scaffold ImageTypes name:string{50}`
      - `rails db:migrate`
        
      - `rails g scaffold Images image_type:references filename:string{250} title:string{75} file_path:text`
      - `rails db:migrate`
      
    - tables with foreign keys
        - `rails g scaffold ProjectSites address:string{100} city:string{50} state:references zipcode:string{6} access_code:string{10} map_link:text`
        - `rails db:migrate`
          
        - `rails g scaffold Companies company_category:references business_name:string{75} contact_name:string{75} address:string{75} city:string{50} state:references zipcode:string{6} phone:string{14} phone_ext:string{6} fax:string{14} email:string{50} website:string{50} image:references`
        - `rails db:migrate`
          
        - `rails g scaffold Bids company:references project_site:references sku:references bid_status:references bid_date:datetime description:text amount:decimal{'6,2'}`
        - `rails db:migrate`
          
        - `rails g scaffold Users username:string{50} password:string{250} access_level:references company:references name:string{50} phone:string{14} phone_ext:string{6} email:string{100}`
        - `rails db:migrate`
          
        - `rails g scaffold Mileages project_site:references vehicle:references invoice:references drive_date:date start_mileage:decimal{'7,1'} end_mileage:decimal{'7,1'} subtotal:decimal{'7,1'} notes:string{150}`
        - `rails db:migrate`
          
        - `rails g scaffold Invoices company:references project_site:references sku:references bid:references term:references start_date:date end_date:date description:text amount:decimal{'8,2'} receipts:integer{1} images:integer{1} image:references mileage:references loan_amount:decimal{'8,2'} loan_paid:integer{1} interest_amount:decimal{'8,2'} interest_paid:integer{1} complete:integer{1} paid:integer{1} paid_checknum:string{50} paid_date:date project_cost:decimal{'8,2'} save_tax:decimal{'8,2'} actual_net:decimal{'8,2'}`
        - `rails db:migrate`
          
        - `rails g scaffold Expenses invoice:references company:references expense_category:references vehicle:references pdate:date name:string{250} quantity:integer{4} amount:decimal{'8,2'} subtotal:decimal{'8,2'} tax_include:integer{1} tax:decimal{'8,5'} total:decimal{'8,2'} receipt_reference:string{100} image:references`
        - `rails db:migrate`

#### Stylesheets and Icons

- folder: `app/assets/stylesheets`
    - add styles.css
    - add normalize.css
        - Reference: [https://necolas.github.io/normalize.css/](https://necolas.github.io/normalize.css/)
    
- folder: `app/assets/images`
    - created folder `favicons`
        - add favicons
    - created folder `icons`
        - add favicons
    - add images
        - Reference: [Icons made by Becris](https://www.flaticon.com/authors/becris)
    
- edit file: `app/view/layouts/application.html.erb`
    - update title
    - add meta tags
    - add favicons
    - add stylesheets

### Frontend

#### VueJS

`yarn global add @vue/cli`
`yarn global add @vue/cli-init`
`vue init webpack invoicing_frontend`
