notes.txt

## Domain Model
1. Signup/Login (Random Article)
2. Search through an api(s) for a company or person
3. Create a Chronicle
4. Save(link or hard text)? specific articles from search to the Chronicle
5. Add filters (2.0)
6.  Create Private and Public Chronicles
    1. Public: Users can have roles on chronicle and admins can add and delete. view
        1. suggest additions (2.0)
7. Search for chronicles


#### Chronicles
has many subscriptions
has many article_chronicles
has many Accounts, through subscriptions
has many Articles, through article_chronicles
has many chronicle_tags
has many tags, through chronicle_tags
has_many comments
name  | admin | type | upvotes | description
Netflix | Rahul | public | 100 | This is about netflix all things

#### Accounts
has many Chronicles
has many Articles, through Chronicles
has secure password
name | email | password_digest | bio
Rahul | rmody3@gmail.com | sadkfj;aslkfj;alkfja; | this is me

#### Articles
has many article_chronicles
has many chronicles, through article_chronicles
title | description | date | url | pic_url  
IPO   | We IPO'ed | 1/1/2000 | www.times.com/netflix/2000/1/1

#### subscriptions (join table)
belongs to account
belongs to chronicle
  account_id | chronicle_id
  Rahul      | Netflix
  Andrew     | Netflix
  Andrew     | Snapchat

#### Articles_Chronicles
belongs to article
belongs to chronicle
  article_id | chronicle_id

#### comments
belong to chronicle
belongs to account
content | account_id | chronicle_id | post_date | upvotes
Netflix is terrible | Rahul | Netflix | 3/8/2017 | 0

#### tags
has many chronicles
name

#### chronicle_tags
belongs to chronicle
belongs to tag
chronicle_id | tag_id
Netflix IPO | Netflix
Netflix IPO | IPO
Netflix in India | Netflix


### Controller

### PAGES

LOGIN / SIGN UP

WELCOME
- Controller: Application
- View: Index,
- Route '/'
- Links: log in / sign up
- Inlcudes: Random Chronicles

Account Profile
-  Controller: Accounts
- View: Show
- Route: Account/:id
- Links to: my chronicles, Search form with chronicles and Articles
- Includes: Bio, use session check to hide private info

Chronicle Search Results
- Controller: Chronicle
- View: Index
- Routes Chronicles/index?params[chronicle_search_params]
- Links to: chronicles,
- Includes chronicle pic card, description, chronicle title


Article Search Results
- Controller: Article
- View: Index
- Routes Articles/index?params[article_search_params]
- Links to: chronicles,
- Includes chronicle pic card, description, chronicle title

Chronicle Show PAGES
- Controller: Chronicle
- view: Show
- Routes: Chronicle/:id
- Links to tags(which will be a post to chronicle search), article url, user profile page
- Includes: Comments

Account Bio
- Controller: Account
- View: Bio
- Routes: Account/:id/Bio
- Links to chronicles
- INclueds comments of account user

Other Controller
Sessions Controller

Plans
Thurs: Models, Sign up
Friday: Models, API, SIGN UP/IN
SAT: Account, Application, sessions,
SUN: Chronicles and Articles
MON: Comments, Bug Fixes, JQUERY FRONT END
TUE: JQUERY FRONT END

RAHULS NOTES:
Still questioning the admin_id in the chronicles table, is this a belongs to relationship

In the comments table, should there be a post_date or should we just just the time stamps



API: