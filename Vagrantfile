Vagrant.configure(2) do |config|
    
    config.vm.define "logstash" do |logstash|
        logstash.vm.synced_folder ".", "/vagrant", disabled: true

        logstash.vm.provider "docker" do |d|
            d.build_dir = "docker/logstash"
            d.name = "logstash"
            d.has_ssh = false
        end
    end

    config.vm.define "redis" do |redis|
        redis.vm.synced_folder ".", "/vagrant", disabled: true

        redis.vm.provider "docker" do |d|
            d.build_dir = "docker/redis"
            d.name = "redis"
            d.has_ssh = false
        end
    end

    config.vm.define "postgres" do |postgres|
        postgres.vm.synced_folder ".", "/vagrant", disabled: true

        postgres.vm.provider "docker" do |d|
            d.build_dir = "docker/postgres"
            d.name = "postgres"
            d.ports = ["5432:5432"]
            d.has_ssh = false
        end
    end

    config.vm.define "elasticsearch" do |elasticsearch|
        elasticsearch.vm.synced_folder ".", "/vagrant", disabled: true

        elasticsearch.vm.provider "docker" do |d|
            d.build_dir = "docker/elasticsearch"
            d.name = "elasticsearch"
            d.has_ssh = false
        end
    end

    config.vm.define "mailhog" do |mailhog|
        mailhog.vm.synced_folder ".", "/vagrant", disabled: true

        mailhog.vm.provider "docker" do |d|
            d.build_dir = "docker/mailhog"
            d.name = "mailhog"
            d.has_ssh = false
        end
    end

    config.vm.define "php" do |php|
        php.vm.synced_folder ".", "/vagrant", disabled: true
        php.vm.synced_folder "code/backend", "/var/www/html"

        php.vm.provider "docker" do |d|
            d.build_dir = "docker/php"
            d.name = "php"
            d.link("redis:redis")
            d.link("postgres:postgres")
            d.link("elasticsearch:elasticsearch")
            d.link("mailhog:mailhog")
            d.has_ssh = false
        end
    end

    config.vm.define "worker" do |worker|
        worker.vm.synced_folder ".", "/vagrant", disabled: true
        worker.vm.synced_folder "code/backend", "/var/www/html"

        worker.vm.provider "docker" do |d|
            d.build_dir = "docker/worker"
            d.name = "worker"
            d.link("redis:redis")
            d.link("postgres:postgres")
            d.link("elasticsearch:elasticsearch")
            d.link("mailhog:mailhog")
            d.has_ssh = false
        end
    end

    config.vm.define "nginx" do |nginx|
        nginx.vm.synced_folder ".", "/vagrant", disabled: true
        nginx.vm.synced_folder "code/backend", "/var/www/html"

        nginx.vm.provider "docker" do |d|
            d.build_dir = "docker/nginx"
            d.name = "nginx"
            d.ports = ["8080:80"]
            d.link("php:php")
            d.link("logstash:logstash")
        end
    end

    config.vm.define "kibana" do |kibana|
        kibana.vm.synced_folder ".", "/vagrant", disabled: true

        kibana.vm.provider "docker" do |d|
            d.build_dir = "docker/kibana"
            d.name = "kibana"
            d.ports = ["5601:5601"]
            d.link("elasticsearch:elasticsearch")
        end
    end
end
