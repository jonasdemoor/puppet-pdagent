require 'spec_helper'

describe 'pdagent::repo::debian' do
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
      when 'Debian'
        context "class pdagent::repo::debian (Debian Stretch)" do

          it { is_expected.to compile.with_all_deps }
          it { is_expected.to contain_class('stdlib')}
          it { is_expected.to contain_class('apt')}

          it { is_expected.to contain_apt__key('pdagent_key').with({
            'id'     => '34241874978E85F344483D714037B2209E65C6CB',
            'source' => 'https://packages.pagerduty.com/GPG-KEY-pagerduty',
            })
          }

          it { is_expected.to contain_apt__source('pdagent_repo').with({
            'comment'  => 'APT repository for PagerDuty Agent',
            'location' => 'https://packages.pagerduty.com/pdagent',
            'repos'    => '',
            'release'  => 'deb/',
            })
          }
        end
      end

    end
  end
end
