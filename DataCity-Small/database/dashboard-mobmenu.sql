
USE Dashboard;

TRUNCATE MobMainMenu;
INSERT INTO MobMainMenu SELECT * FROM MainMenu;

TRUNCATE MobMainMenuSubmenus;
INSERT INTO MobMainMenuSubmenus SELECT * FROM MainMenuSubmenus;

