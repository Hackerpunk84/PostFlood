# PostFloodCancel changes
PostFlood is a simple script written in ruby ​​that allows you to access, for example, a personal area through a login.php page, recover the session:id from the cookie and flod a section of a blog.

use the browser inspector to retrieve the tag names

1) open the PostFlood.rb file and replace the 'user' and 'pass' parameters with those retrieved from the login.php form html tags
login_param = URI.encode_www_form({'user'=>Username,'pass'=>Password})
---------------------------------------------------------------------------------------------------------------------------------------

2)replace or add html tags: 'name' ,'comment', 'cat' with those retrieved from the input form to comment or write a post
flood_param = URI.encode_www_form({'name'=>'FLOOD','comment' =>'FROM RUBY','cat' =>'1'})

----------------------------------------------------------------------------------------------------------------------------------------

replace the sendmsg_confirmation.php page with the page retrieved from the 'action' html tag of the comment or post submission form
http.post("/sendmsg_confirmation.php",flood_param, 'cookie'=>session_id) 
------------------------------------------------------------------------------------------------------------------------------------------

register on the platform with a test account and insert the credentials in the command together with the number of comments to be flooded identified by
start the script with the command:

## $ruby PostFlood <host.com> <username> <password> <int>

the script is being improved. Collaborations are welcome to extend its function. thank you
