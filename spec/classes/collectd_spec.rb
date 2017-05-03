require 'spec_helper'

describe 'profiles::collectd' do
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

        let :facts do
          needed_facts = { collectd_version: '5.5.0', python_dir: '/usr/local/lib/python2.7/dist-packages' }
          facts.merge(needed_facts)
        end
        let :params do
          {
            logstash_ip: '123.123.123.123'
          }
        end
        it { is_expected.to compile.with_all_deps }
        it { is_expected.to contain_class('collectd') }
        it { is_expected.to contain_class('collectd::plugin::cpu') }
        it { is_expected.to contain_class('collectd::plugin::df') }
        it { is_expected.to contain_class('collectd::plugin::cpufreq') }
        it { is_expected.to contain_class('collectd::plugin::conntrack') }
        it { is_expected.to contain_collectd__plugin__network__server('123.123.123.123')}
      end
    end
  end
end
