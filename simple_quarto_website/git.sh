printf 'Would you like to sync with the GitHub server: (y/n)?'
read answer
if [ "$answer" != "${answer#[Yy]}" ] ;then # basically generalizes. If my answer isn't any form of Y, y, or yes, this wont run.

    # PULL CLOUD REPO TO LOCAL
    git pull 
    
    # change buffer settings ; basically optimizes for handling larger files
    git config http.postBuffer 524288000 

    # SYNC TO LOCAL REPO TO CLOUD 
    read -p 'ENTER MESSAGE: ' message
    echo "commit message = "$message; 
    
    # ADD CHANGES TO QUEUE, this line adds changes from the entire folder. Revisit this when I learn more
    git add ../; 
    
    # MAIN BRANCH
    git commit -m "$message"; 

    # PUSH NON-MAIN BRANCH, I don't have one yet
    # git push  -u origin branch_name

    # PUSH MAIN BRANCH
    git push

else
    echo Not synched to GitHub!
fi