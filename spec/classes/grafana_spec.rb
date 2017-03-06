require 'spec_helper'

describe 'profiles::grafana' do
  let :node do
    'agent.example.com'
  end
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end
      context 'with all defaults' do
        it { is_expected.to contain_class('profiles::grafana') }
        it { is_expected.to compile.with_all_deps }
      end
    end
  end
end