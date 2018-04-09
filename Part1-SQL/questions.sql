-- Here are some questions to answer
-- Keep the questions in the file, and just put the answers below the questions.

/*
  About the DATA
  There are 4 tables
  here is a list with descriptions

  IMPORTANT: YOU MAY CHANGE THE TABLE STRUCTURES IF YOU WOULD LIKE.
      THE LAST QUESTION WILL ASK ABOUT ALL YOUR CHANGES.

  - users
     - just a list of user data
  - emails
     - holds users emails.
     - There is a one to many relationship with the users table. Each user can have many emails
     - One email is marked as the primary email for the user
  - usage_log
     - holds the users session dates and times.
     - contains the login and logout times of every user session.
     - So every time a user logs in, it creates a new entry in this table
  - users_admin
     - only holds a user id
     - if a user's id is in this table, then they are an admin
*/

-- EXAMPLE
-- Write a statement that will return all the users
--  with the last name 'Johnson'
SELECT *
FROM users
WHERE lName = 'Johnson';


-- QUESTION 1
-- write a statement that returns all the users data
--   including their primary email, if they have one
--   and if they are an admin or not
SELECT u.*, e.email
FROM users u LEFT JOIN emails e ON e.userId = u.id AND e.primary = 1



-- QUESTION 2
-- write a statement that returns all user data
--   including their primary email
--   and if they are an admin or not
--   but only users with emails
SELECT u.*, e.email
FROM users u JOIN emails e ON e.userId = u.id AND e.primary = 1


-- QUESTION 3
-- write a statement that returns all user data
--   that do not have an email
--   and are not admins
SELECT *
FROM users
WHERE id NOT IN (SELECT userId FROM emails) AND (admin = 0 OR admin IS NULL)


-- QUESTION 4
-- write a statement that returns all the users data
--    only users with last name that contains a letter 'B'
--    and also return the number of emails those users have
SELECT u.id, u.fName, u.lName, u.age, u.date, u.admin, COUNT(e.id) AS email_count
FROM users u LEFT JOIN emails e ON e.userId = u.id
WHERE lName LIKE '%B%'
GROUP BY u.id, u.fName, u.lName, u.age, u.date, u.admin


-- QUESTION 5
-- write a statement that returns all the users data
--    only users that have more than one email
--    and are admins
SELECT u.id, u.fName, u.lName, u.age, u.date, u.admin, COUNT(e.id) AS email_count
FROM users u LEFT JOIN emails e ON e.userId = u.id
WHERE admin = 1
GROUP BY u.id, u.fName, u.lName, u.age, u.date, u.admin
HAVING COUNT(e.id) > 1


-- QUESTION 6
-- write a statement that returns all user data
--   with the total amount of time the users have spent on the site
--   in the past 21 days, in minutes
SELECT u.id, u.fName, u.lName, u.age, u.date, u.admin, ul.time_on_site
FROM users u LEFT JOIN (
	SELECT userId, SUM(DATEDIFF(minute, login, logout)) AS time_on_site
	FROM usage_log
	WHERE DATEDIFF(day, login, GETDATE()) <= 21
) ul ON ul.userId = u.id
/* 
Becasue of slight ambiguity and for simplicity, 
this query is going off of logins in the past 21 days. 
*/


-- QUESTION 7
-- Write a statement that returns all user data
--   with the total amount of time spent on the site
--   and with the total number of logins
--   beginning of time
SELECT u.id, u.fName, u.lName, u.age, u.date, u.admin, 
	SUM(DATEDIFF(minute, ul.login, ul.logout)) AS time_on_site, COUNT(ul.id) AS num_logins
FROM users u LEFT JOIN usage_log ul ON ul.userId = u.id
GROUP BY u.id, u.fName, u.lName, u.age, u.date, u.admin


-- QUESTION 8
-- given the table structure provided.
-- How would you did/would you change/improve our schema? Any Why?
-- Please list all changes that were made and a justification for the change.
/*

First, I added userId columns to the emails and usage_log tables so those tables could be linked to
the users table.  Most of these queries wouldn't be possible without these columns.

Next, I got rid of the user_admin table and added a column to the user table called admin.  Having
a separate table isn't necessary as it is an attribute of the user.

I also added primary and foreign keys where applicable for the sake of data integrity.

I didn't change any names but I would suggest changing some column names to a more clear naming 
convention like lName to last_name.  Also, a few column types could be changed to save a little
space like age could be an TINYINT or SMALLINT, the first and last name and email fields could 
be smaller VARCHARs, the emails primary fields could be a TINYINT instead of INT.  And, if I'm 
not mistaken, the sessionId should be a VARCHAR instead of an INT since they can have letters
and numbers.

*/
