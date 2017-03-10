# Chronicle


## Domain Model
1. Signup/Login (Random Article)
2. Search through an api(s) for a company or person
3. Create a Topic
4. Save(link or hard text)? specific articles from search to the Topic
5. Add filters (2.0)
6.  Create Private and Public Topics
    1. Public: Users can have roles on topic and admins can add and delete. view
        1. suggest additions (2.0)
7. Search for topics


#### Topics
has many subscriptions
has many article_topics
has many Accounts, through subscriptions
has many Articles, through article_topics
has many Topic_tags
has many tags, through topic_tags
name  | admin | type | upvotes | description
Netflix | Rahul | public | 100 | This is about netflix all things

#### Accounts
has many Topics
has many Articles, through Topics
has secure password
name | email | password_digest | bio
Rahul | rmody3@gmail.com | sadkfj;aslkfj;alkfja; | this is me

#### Articles
has many article_topics
has many topics, through article_topics
title | snippet | date | url | pic_url  
IPO   | We IPO'ed | 1/1/2000 | www.times.com/netflix/2000/1/1

#### subscriptions (join table)
belongs to account
belongs to topic
  account_id | topic_id
  Rahul      | Netflix
  Andrew     | Netflix
  Andrew     | Snapchat

#### Articles_Topics
belongs to article
belongs to topic
  article_id | topic_id

#### comments
belong to topic
belongs to account
content | account_id | topic_id | post_date | upvotes
Netflix is terrible | Rahul | Netflix | 3/8/2017 | 0

#### tags
has many topics
name

#### Topic_tags
belongs to topic
belongs to tag
topic_id | tag_id
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
- Inlcudes: Random Topics

Account Profile
-  Controller: Accounts
- View: Show
- Route: Account/:id
- Links to: my topics, Search form with topics and Articles
- Includes: Bio, use session check to hide private info

Topic Search Results
- Controller: Topic
- View: Index
- Routes Topics/index?params[topic_search_params]
- Links to: topics,
- Includes topic pic card, description, topic title


Article Search Results
- Controller: Article
- View: Index
- Routes Articles/index?params[article_search_params]
- Links to: topics,
- Includes topic pic card, description, topic title

Topic Show PAGES
- Controller: Topic
- view: Show
- Routes: Topic/:id
- Links to tags(which will be a post to topic search), article url, user profile page
- Includes: Comments

Other Controller
Sessions Controller

Plans
Thurs: Models, Sign up
Friday: Models, API, SIGN UP/IN
SAT: Account, Application, sessions,
SUN: Topics and Articles
MON: Comments, Bug Fixes, JQUERY FRONT END
TUE: JQUERY FRONT END
