def label = "worker-${UUID.randomUUID().toString()}"
podTemplate(label: label, containers: [
        containerTemplate(name: 'centos', image: 'centos:centos7', ttyEnabled: true),
        containerTemplate('name': 'ubuntu', image: 'ubuntu:latest', ttyEnabled: true)
]) {
    node(label) {
        stage('Install CentOS 7') {
            container('centos') {
                sh 'cat /etc/*-release'
            }
        }
        stage('Install Ubuntu') {
            container('ubuntu') {
                sh 'cat /etc/*-release'
            }
        }
    }
}