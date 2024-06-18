#!/bin/bash

export MYSQL_PWD=rootpwd
export HOST=192.168.1.119
export USER=root

echo Dashboard
mysqldump --no-data -h $HOST -u $USER --databases Dashboard | sed 's/ AUTO_INCREMENT=[0-9]*//g' > dashboard.sql
mysqldump --no-create-info -h $HOST -u $USER Dashboard DashboardTemplates DataInspector Descriptions Domains Organizations | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> dashboard.sql
mysqldump --no-create-info -h 192.168.0.37 -u root -p Dashboard Widgets WidgetsIconsMap multilanguage HeatmapRanges HeatmapColorLevels fileextensions | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> dashboard.sql

echo "USE Dashboard;" > dashboard-menu.sql
mysqldump --no-create-info -h $HOST -u $USER Dashboard MainMenu MainMenuSubmenus | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> dashboard-menu.sql


echo "USE Dashboard;" > dashboard-wizard-min.sql
mysqldump --no-create-info -h $HOST -u $USER --databases Dashboard --tables DashboardWizard --where="high_level_type IN ('POI','MicroApplication','Special Widget','External Service','HeatMap','Complex Event') AND low_level_type!='15minsubindex'" >> dashboard-wizard-min.sql

echo ServiceMap
cat > servicemap.sql <<-END
	CREATE SCHEMA \`ServiceMap\` DEFAULT CHARACTER SET utf8;
	GRANT ALL ON ServiceMap.* TO 'user'@'%';
END

mysqldump --no-data -h $HOST -u $USER --databases ServiceMap | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> servicemap.sql
mysqldump --no-create-info -h $HOST -u $USER ServiceMap ServiceCategory_menu_NEW ServiceMapping >> servicemap.sql

echo SuperServiceMap
cat > superservicemap.sql <<-END
CREATE SCHEMA \`SuperServiceMap\` DEFAULT CHARACTER SET utf8;
GRANT ALL ON SuperServiceMap.* TO 'user'@'%';
END
mysqldump --no-data -h $HOST -u $USER --databases SuperServiceMap | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> superservicemap.sql
mysqldump --no-create-info -h $HOST -u $USER SuperServiceMap servicemaps >> superservicemap.sql

echo iotdb
cat > iot-directory.sql <<-END
CREATE SCHEMA \`iotdb\` DEFAULT CHARACTER SET utf8;
GRANT ALL ON iotdb.* TO 'user'@'%';
END
mysqldump --no-data -h $HOST -u $USER --databases iotdb | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> iot-directory.sql
mysqldump --no-create-info -h $HOST -u $USER iotdb functionalities mainmenu defaultpolicy formats protocols data_types defaultcontestbrokerpolicy >> iot-directory.sql

echo profiledb
cat > profiledb.sql <<-END
CREATE SCHEMA \`profiledb\` DEFAULT CHARACTER SET utf8;
GRANT ALL ON profiledb.* TO 'user'@'%';
END
mysqldump --no-data -h $HOST -u $USER --databases profiledb | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> profiledb.sql
mysqldump --no-create-info -h $HOST -u $USER profiledb limits >> profiledb.sql
mysqldump --no-create-info -h $HOST -u $USER --databases profiledb --tables ownership --where="elementtype='APPID'" >> profiledb.sql

echo processloader_db
cat > processloader.sql <<-END
CREATE SCHEMA \`processloader_db\` DEFAULT CHARACTER SET utf8;
GRANT ALL ON processloader_db.* TO 'user'@'%';
END
mysqldump --no-data -h $HOST -u $USER --databases processloader_db | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> processloader.sql
mysqldump --no-create-info -h $HOST -u $USER processloader_db MainMenu dictionary_relations dictionary_table functionalities  >> processloader.sql

echo Notificator 
cat > notificator.sql <<-END
CREATE SCHEMA \`Notificator\` DEFAULT CHARACTER SET utf8;
GRANT ALL ON Notificator.* TO 'user'@'%';
END
mysqldump --no-data -h $HOST -u $USER --databases Notificator | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> notificator.sql
mysqldump --no-create-info -h $HOST -u $USER Notificator clientApplications emailBook eventGenerators >>  notificator.sql

echo DataTable and POI Loader
cat > datatable.sql <<-END
CREATE SCHEMA \`datatable\` DEFAULT CHARACTER SET utf8;
GRANT ALL ON datatable.* TO 'user'@'%';
END
mysqldump --no-data -h $HOST -u $USER --databases datatable | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> datatable.sql

echo heatmap 
cat > heatmap.sql <<-END
CREATE SCHEMA \`heatmap\` DEFAULT CHARACTER SET utf8;
GRANT ALL ON heatmap.* TO 'user'@'%';
END
mysqldump --no-data -h $HOST -u $USER --databases heatmap | sed 's/ AUTO_INCREMENT=[0-9]*//g' >> heatmap.sql
mysqldump --no-create-info -h $HOST -u $USER heatmap colors >>  heatmap.sql
