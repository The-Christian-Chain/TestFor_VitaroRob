###############################################################
##                                                           ##
##                    Login Information                      ##
##                                                           ##
###############################################################

Administrator
    Email: admin@t.com
    Password: topsecret

Basic Members
    Email: member1@t.com
    Password: password    

    Email: member2@t.com
    Password: password    

    Email: member3@t.com
    Password: password    

    Email: member4@t.com
    Password: password    

    Email: member5@t.com
    Password: password    

###############################################################
##                                                           ##
##                       Bug Reports                         ##
##                                                           ##
###############################################################

1) A few of the header links have bugs and the pages won't load.
2) Pages won't load for admins. Change Profile model to have security level be a name rather than a number. Set it to be:
    1 = basic
    2 = moderator
    3 = admin
    4 = super_admin
3) The member ID on the profile page shows a hash instead of the ID number.
4) ActionCable keeps launching on every page instead of just a blog post page where there is a comment channel. 
5) The Homepage design isn't quite right. The text that is supposed to be to the right of the card with the techniques being tested is showing below the card. 

###############################################################
##                                                           ##
##                         To Dos                            ##
##                                                           ##
###############################################################

1) Remove ability to change member id and universal id in the profile and to change the username after it was already created
2) Verify that there is only one profile per member
3) Verify that the member username is unique
4) Change birthday view on profile to be month day, year format (January 1, 2020)
5) Change the 'universal_id' table in the profile to be 'global_id'
6) Remove the location column on blog posts and add the ability to create and excerpt for the post.
7) Add a definition in the Posts Concern called "can_create_post" and have it check if the member signed in is an admin and thus can create a post. Have that be checked when creating a new post.
8) Add SEO meta tags to the header of each page on the site.
9) Add profile logic to allow member to agree to get newsletter or not. 
10) Change the background color of the header sections for Bootstrap cards to be the primary color and the text color to be the secondary color of the site (these colors are stored in the Site Settings Table). 

###############################################################
##                                                           ##
##                   Code Enhancements                       ##
##                                                           ##
###############################################################

1) Looking at the members index page as an admin calls 11 queries to the database just to show 6 members. Refactor code for index page to get ride of the n+1 issue.
2) Edit the form template used for scaffolding and form generations to put the delete and submit buttons at the top of all new the forms upon generation.
3) Every page load pulls a Settings Table query. Change this code to check for a settings cookie, if not present then pull from the Settings Table all settings and create a site cookie. Have this cookie expire after 48 hours. And have each page load then check the cookies for the settings rather than the database. 
4) The navbar brand section doesn't use correct full Ruby syntax for creating the link. Change to use correct Ruby syntax.
5) Send the welcome email that is already setup for you to be sent out after registration using ActionMailer and ActiveJob to deliver it later. 
6) Have the entire profile page auto update the database record when changes are made without refreshing the page or the member having to click save. 
7) Have a color picker on the Settings edit page for the admin to choose the primary and secondary colors of the site. 
    - Have these values be dynamically updated so that the CSS does not need to be changed. 

###############################################################
##                                                           ##
##                       Final Steps                         ##
##                                                           ##
###############################################################

1) Dockerize the final app.
2) Push final code back to Git.