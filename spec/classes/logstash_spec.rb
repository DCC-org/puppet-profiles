require 'spec_helper'

describe 'profiles::logstash' do
  let :node do
    'agent.example.com'
  end
  on_supported_os.each do |os, facts|
    context "on #{os} " do
      let :facts do
        facts
      end
      context 'with all defaults' do
        it { is_expected.not_to compile.with_all_deps }
      end

      context 'with working params' do
        let :params do
          {
            psql_ip: '123',
            psql_user: 'admin',
            psql_pw: 'password'
          }
        end
        it { is_expected.to compile.with_all_deps }
      end
    end
  end
end
