require 'spec_helper'

describe 'pdagent::install' do
  on_supported_os.each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { 
        os_facts 
      }

      context "class pdagent::install with default parameters" do
        it { is_expected.to compile.with_all_deps }

        it { is_expected.to contain_package('pdagent')}
        it { is_expected.to contain_package('pdagent-integrations')}
      end

    end
  end
end
