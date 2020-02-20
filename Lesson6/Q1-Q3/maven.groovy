def label = "maven-pod-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
        containerTemplate(name: 'maven', image: 'maven:3.3.9-jdk-8-alpine', ttyEnabled: true, command: 'cat')
]) {
    node(label) {
        stage('Get a maven project') {
            git 'https://github.com/web3j/sample-project-maven.git'
            container('maven') {
                stage('Build a Maven project') {
                    sh 'mvn web3j:generate-sources'
                    sh 'mvn clean install'
                }
            }
        }
    }
}