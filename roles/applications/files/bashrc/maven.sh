export M2_HOME="/home/guilherme/applications/apache-maven-3.3.9"
export MAVEN_OPTS="-Xms256M -Xmx1368M  -XX:MaxPermSize=256M" #-Dfile.encoding=UTF-8 -Dclient.encoding.override=UTF-8"
export PATH=$M2_HOME/bin:$PATH


alias mi="mvn clean install"
alias mis="mvn clean install -DskipTests"
