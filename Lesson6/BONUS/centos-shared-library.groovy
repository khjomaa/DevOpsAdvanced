@Library('jenkins-shared-library@master') _

def podLabel = "centos-${UUID.randomUUID().toString()}"
centosRunner(podLabel) {
    node(podLabel) {
        stage('Run CentOS') {
            container('centos') {
                sh 'cat /etc/*-release'
            }
        }
    }
}