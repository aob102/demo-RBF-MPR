*** Settings ***
Library    OperatingSystem
Library    Collections 
Library    String       


*** Variables ***
${loc_prénom}  //input[@name="firstName"]
${loc_nom}  //input[@name="lastName"]
${loc_email}  //input[@id="userfield"]
${loc_mdp}  //input[@id="passwordfield"]
${loc_valider}  //button[@type="submit"]/span
${loc_mainMenu}  //*[@name='user']
${loc_logOut}   //*[@class='user-menu-btn logout-btn']