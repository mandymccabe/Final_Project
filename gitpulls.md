
PROCESS FOR PULL/PUSH REQUESTS

Create branch, make changes, review and approve, merge into main branch.

It's a best practice to either "pull" from the main branch to get the latest changes to the main branch, or pull "upstream" of the branch you are creating. This is important because your version of the main branch on your computer needs to be up to date with the main branch on GitHub. (13.3.1)

To create a new branch:
Git branch name

To view all branches:
Git branch
There will be a * on the branch you are currently on.

To move to different branch:
Git checkout name

To edit within branch:
Git checkout name
Git status
Git add .
Git status
Git commit -m "notes"
Git push

TO MERGE: 
Create pull request on GitHub.
Review (make sure they similar files can be merged). This cannot happen if changes have been made to the main branch after you have added files to a branch. 

Select branch you want
Click Compare& pull request button. This opens a new page called: Open a pull request

1. Near the top of the page is a green checkmark and text "Able to merge." If you are unable to merge, GitHut will display a message.
2. Commit the message you made.
3. "Reviewers" and "Assignees" are members with access to the repository. You can assign the pull request to yourself. 
4. "Leave a comment" field, describe what you are adding to the main branch in the pull request.
5. After entering comment, click green "Create pull request" button.

MERGING A BRANCH INTO THE MAIN BRANCH: 13.3.4
Make sure the base is set to main branch
Can add labels, ask for approval or assign a reviewer. Click Create pull request button.
After clicking Merge pull request button and click "Confirm merge" 
Status should change from open to merged.

To update on your local machine: 
Type git checkout main in git bash
Then, git pull origin main

Not sure if we will be deleting the branches?
