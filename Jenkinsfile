pipeline {

    agent any

    stages {

        stage('Build') {
            steps {
                sh 'docker build -t overlaid/ansible .'
            }
        }

        stage('Test') {
            steps {
                sh 'docker run -t overlaid/ansible ansible-playbook playbooks/deploy_vlan.yml -l veos1 --check --diff'
                sh 'echo $BUILD_ID'
            }

        stage('Deploy') {
            when {
                changelog 'approved'
            }
            steps {
                sh 'docker run -t overlaid/ansible ansible-playbook playbooks/deploy_vlan.yml -l veos1'
            }
        }
    }
}