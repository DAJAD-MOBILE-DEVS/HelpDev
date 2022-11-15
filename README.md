# HelpDev

## Table of Contents
1. [Overview](#Overview)
1. [Product Spec](#Product-Spec)
1. [Wireframes](#Wireframes)
2. [Schema](#Schema) 

## Overview
### Description
The JAD app is for anyone who aspires to learn programming at the beginner level. It is mainly targeted at students, however, anyone can use the JAD app! The app offers 3 programming languages with basic syntax tutorials and a public forum for discussion.

### App Evaluation

- **Category:** Coding help / Coding Forum
- **Mobile:** This app will be developed for mobile devices only
- **Story:** The purpose of this app is to help people who want to learn more about the three coding languages provided in out app as well as being able to ask coding questions that they need answered.
- **Market:** The most suitable audeince we would make this application for would be middle and high schoolers looking to start learning the basiscs of coding.
- **Habit:** This app can be used as often as the user wants as they are in control of how they learn using the app and can seek further guidance with the question forum.
- **Scope:** First we would start with getting the coding basics to provide our users with to learn then evolve the application for coding help with users being able to create accounts and posting questions.

## Product Spec

### 1. User Stories (Required and Optional)

**Required Must-have Stories**

* [x]User can create an account to login

![](https://i.imgur.com/UUbnkHx.gif)

* [x] User can login anonomously to use the app without an account
* [] User can post a question
* [] User can reply to other questions
* [] User can navigate app with tabs in the navigation bar
* [] Users are able to upload photos in addition to text when posting a question
* [] User can view information on any of the 3 coding languages provided by the app

**Optional Nice-to-have Stories**

* User can customize their accounts (profile pictures, name)
* Upvote or downvote buttons on question posts
* User questions can have a verified answer
* Users can be upgraded to verified members
* Live help chat service

### 2. Screen Archetypes
* Login
    * User can create an account to login
* Signin/Singup/Anonymus user
    * User can login anonomously to use the app without an account
* Programming language navigation tab
    * User can navigate app with tabs in the navigation bar
    * User can view information on any of the 3 coding languages provided by the app
* Q&A Tab
    * User can post a question a question and reply to other questions
    * Users are able to upload photos in addition to text when posting a question

### 3. Navigation

**Tab Navigation** (Tab to Screen)

* Java Documentation
* Python Documentation
* Swift Documentation
* Q&A Tab

Optional:
* User profile --> User can change username and profile pic
* App settings --> User can remove/interchange tabs

**Flow Navigation** (Screen to Screen)

* Optional Login/Singup screen or anonymus button --> Programming language/Q&A tab bar
* Java icon --> Java documentation page
* Python icon --> Python Documentation page
* Swift icon --> Swift Documentation page
* Q&A icon --> Q&A forum

  
## Wireframes

![](https://i.imgur.com/A8kWvWQ.png)

### [BONUS] Digital Wireframes & Mockups

![](https://i.imgur.com/BOQda6u.png)

### [BONUS] Interactive Prototype

![](https://i.imgur.com/MiJGd1R.gif)


## Schema 


### Models





| Property        | Type    | Description                                   |
| --------------- | ------- | --------------------------------------------- |
| Object ID       | String  | User posts ID's                               |
| User ID         | String  | Stores the unique user ID                     |
| User            | Pointer to User    ID    |Username                                          |
| Anonymous User  | Boolean | A true or false value for logging in          |
| Profile Picture | File    | A profile picture that the user can customize |
| Comments        | String  | The comment content stored into a string      |
| Embeded Video   | String  |   the address of the link of the youtube video                                            |
|                 |         |                                               |

### Networking
List of network requests by screen 

* Login Screen 
  * (Read/GET) Login information
  ![](https://i.imgur.com/vuKrsVg.png)
  * (Create/POST)Singup
  ![](https://i.imgur.com/4yKVKmt.png)
* Q&A Screen
  * (Create/POST) Post question
  ![](https://i.imgur.com/w0Xaa7N.png)
  * (Read/GET) Retrieve list of questions
  * (Create/POST) Create a new comment
  ![](https://i.imgur.com/Oop0plm.png)
  * (Read/GET) Retrieve list of comments/replies on each post
   

     
