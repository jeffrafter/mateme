Mateme is a simple patient registration application written in Ruby on Rails
and is intended as a web front end for OpenMRS. 

OpenMRS® is a community-developed, open-source, enterprise electronic medical 
record system framework. We've come together to specifically respond to those 
actively building and managing health systems in the developing world, where 
AIDS, tuberculosis, and malaria afflict the lives of millions. Our mission is 
to foster self-sustaining health information technology implementations in 
these environments through peer mentorship, proactive collaboration, and a code 
base that equals or surpasses proprietary equivalents. You are welcome to come 
participate in the community, whether by implementing our software, or 
contributing your efforts to our mission!

Mateme was built by Baobab Health and Partners in Health in
Malawi, Africa. It is licensed under the Mozilla Public License.


Setup
=====
git clone git://github.com/jeffrafter/mateme.git 
cd mateme

$ cp config/database.yml.example config/database.yml

development:
  adapter: mysql
  database: lalanje_development
  username: root
  password:
  host: localhost

test:
  adapter: mysql
  database: lalanje_test
  username: root
  password: 
  host: localhost

cucumber:
  adapter: mysql
  database: lalanje_test
  username: root
  password: 
  host: localhost


$ mysql -u root -p
mysql> create database lalanje_test;
Query OK, 1 row affected (0.01 sec)
mysql> create database lalanje_development;
Query OK, 1 row affected (0.01 sec)

$ mysql -u root lalanje_test < db/schema.sql
$ mysql -u root lalanje_test < db/openmrs_metadata.sql 
$ mysql -u root lalanje_test < db/defaults.sql 
$ mysql -u root lalanje_test < db/data/nno/nno.sql
$ mysql -u root lalanje_test < db/data/nno/tasks.sql
$ rake test
$ rake cucumber

$ mysql -u root lalanje_development < db/schema.sql
$ mysql -u root lalanje_development < db/openmrs_metadata.sql 
$ mysql -u root lalanje_development < db/defaults.sql 
$ mysql -u root lalanje_development < db/data/nno/nno.sql
$ mysql -u root lalanje_development < db/data/nno/tasks.sql
