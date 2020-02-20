@Library('jenkins-shared-library@master') _

def label = "maven-pod-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
        containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat')
]) {
    node(label) {
        stage("Get a maven project") {
            gitCheckout(
                    branch: "master",
                    url: "https://github.com/web3j/sample-project-maven.git"
            )
        }
        stage("Build a Maven project") {
            container('maven'){
                sh 'mvn web3j:generate-sources'
                sh "mvn clean install"
            }
        }
    }
}
