require 'spec_helper'

describe 'pdagent::repos' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { 
        os_facts 
      }

      case  os_facts[:osfamily]
      when 'Debian'
        context "class pdagent::repos with manage_repos = true (Debian)" do

          let(:params) do 
            {
              'manage_repos' => true, 
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('pdagent::repo::debian')}
          it { should_not contain_class('pdagent::repo::redhat')}
        end

        context "class pdagent::repos with manage_repos = false (Debian)" do

          let(:params) do 
            {
              'manage_repos' => false, 
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { should_not contain_class('pdagent::repo::debian')}
          it { should_not contain_class('pdagent::repo::redhat')}
        end

      when 'RedHat'
        context "class pdagent::repos with manage_repos = true (RedHat)" do

          let(:params) do 
            {
              'manage_repos' => true, 
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { is_expected.to contain_class('pdagent::repo::redhat')}
          it { should_not contain_class('pdagent::repo::debian')}
        end

        context "class pdagent::repos with manage_repos = false (RedHat)" do

          let(:params) do 
            {
              'manage_repos' => false, 
            }
          end

          it { is_expected.to compile.with_all_deps }

          it { should_not contain_class('pdagent::repo::debian')}
          it { should_not contain_class('pdagent::repo::redhat')}
        end
      end

    end
  end
end
