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
            }

            post {
                success {
                    echo 'I will only get executed if this success'
                }
                failure {
                    echo 'I will only get executed if this fails'
                }
            }
        }

        stage('Deploy') {
            steps {
                sh 'docker run -t overlaid/ansible ansible-playbook playbooks/deploy_vlan.yml -l veos1'
            }
        }
    }
}