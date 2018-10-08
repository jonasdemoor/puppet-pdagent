require 'spec_helper'

describe 'pdagent::repo::redhat' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { 
        os_facts 
      }

      before(:each) do
        # Fake assert_private function from stdlib to not fail within this test
        Puppet::Parser::Functions.newfunction(:assert_private, :type => :rvalue) { |args|
        }
      end

      case  os_facts[:osfamily]
      when 'RedHat'
        context "class pdagent::repo::redhat (RHEL 7)" do

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('stdlib')}
        
          it { is_expected.to contain_yumrepo('PDAgent') .with({
              'ensure'   => 'present',
              'baseurl'  => 'https://packages.pagerduty.com/pdagent/rpm',
              'enabled'  => 'true',
              'gpgcheck' => 'true',
              'gpgkey'   => 'https://packages.pagerduty.com/GPG-KEY-RPM-pagerduty',
            }) 
          }
        end 
      end

    end
  end
end
