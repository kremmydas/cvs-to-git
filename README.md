# Pre-Requisites:
*  Directory Structure:

    Create directories to be used for the migration. Three directories named cvs, git and cvs2svn-2.5.0, in /tmp will be used.
    * /tmp/cvs will be used to hold the clone of the cvs repository
    * /tmp/git will be used to hold the converted projects.
    * /tmp/cvs2svn-2.5.0 will be used during the conversion. Data will be extracted from /tmp/cvs, pulled into /tmp/cvs2svn-2.5.0/cvs2git-tmp   
        and used to create conversion logs, which will be used to populate the final converted projects in /tmp/git.

    ```  
    mkdir /tmp/{cvs,git}
    ```

* Go to the folder that contains this README.md file and copy "cvs2svn-2.5.0" folder in /tmp

    ```  
    cp -a cvs2svn-2.5.0 /tmp/
    ```  

# Run the CVS migration

* Go to the folder that contains this README.md file and run the cvs_migration.sh script:

    ```  
    ./cvs_migration.sh
    ```  

## Useful links:
- [cvs2git Documentation](http://cvs2svn.tigris.org/cvs2git.html)
- [Import bare repositories into your GitLab instance](https://docs.gitlab.com/ce/raketasks/import.html)
