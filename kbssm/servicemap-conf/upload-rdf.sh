#!/bin/sh
curl --digest --user dba:dba -X POST --url "http://$1:8890/sparql-graph-crud-auth?graph-uri=$2" -T "$3" 

