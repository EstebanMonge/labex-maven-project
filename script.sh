JENKINS_WAR_HOME='/var/lib/jenkins/workspace/alibabacloud/target'
DOCKERFILE_HOME='/var/lib/jenkins/build'
HARBOR_IP='registry-intl.ap-southeast-1.aliyuncs.com'
REPOSITORIES='enchulameelphone/enchulameelphone'
HARBOR_USER='comasano@gmail.com'
HARBOR_USER_PASSWORD='chachan'
\cp -f ${JENKINS_WAR_HOME}/MyMavenApp.war ${DOCKERFILE_HOME}/MyMavenApp.war
sudo docker login -u ${HARBOR_USER} -p ${HARBOR_USER_PASSWORD} ${HARBOR_IP}
IMAGE_ID=`sudo docker images | grep ${REPOSITORIES}|awk '{print $3}'`
if [ -n "${IMAGE_ID}" ];then
sudo docker rmi ${IMAGE_ID}
fi
cd ${DOCKERFILE_HOME}
TAG=`date +%Y%m%d-%H%M%S`
sudo docker build -t ${HARBOR_IP}/${REPOSITORIES}:${TAG} .
sudo docker push ${HARBOR_IP}/${REPOSITORIES}:${TAG}
