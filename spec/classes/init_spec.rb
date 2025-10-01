# frozen_string_literal: true

require 'spec_helper'

describe 'sysstat' do
  on_supported_os({
                    supported_os: [
                      {
                        'operatingsystem' => 'RedHat',
                        'operatingsystemrelease' => ['8', '9'],
                      },
                    ],
                  }).each do |os, facts|
    context "when #{os}" do
      let(:facts) do
        facts.merge({
                      concat_basedir: '/dne',
                    })
      end

      it { is_expected.to compile.with_all_deps }

      it { is_expected.to create_class('sysstat') }
      it { is_expected.to contain_class('sysstat::params') }

      it { is_expected.to contain_class('sysstat::install').that_comes_before('Class[sysstat::config]') }
      it { is_expected.to contain_class('sysstat::config').that_notifies('Class[sysstat::service]') }
      it { is_expected.to contain_class('sysstat::service') }

      describe 'sysstat::install' do
        it do
          is_expected.to contain_package('sysstat').only_with({
                                                                ensure: 'present',
                                                                name: 'sysstat',
                                                              })
        end
      end

      describe 'sysstat::config' do
        it do
          is_expected.to contain_file('/etc/sysconfig/sysstat').with({
                                                                       ensure: 'file',
                                                                       path: '/etc/sysconfig/sysstat',
                                                                       owner: 'root',
                                                                       group: 'root',
                                                                       mode: '0644',
                                                                     })
        end

        it do
          is_expected.to contain_shellvar('/etc/sysconfig/sysstat-HISTORY').with({
                                                                                   target: '/etc/sysconfig/sysstat',
                                                                                   variable: 'HISTORY',
                                                                                   value: '28',
                                                                                 })
        end

        it do
          is_expected.to contain_shellvar('/etc/sysconfig/sysstat-COMPRESSAFTER').with({
                                                                                         target: '/etc/sysconfig/sysstat',
                                                                                         variable: 'COMPRESSAFTER',
                                                                                         value: '31',
                                                                                       })
        end

        it do
          is_expected.to contain_shellvar('/etc/sysconfig/sysstat-SADC_OPTIONS').with({
                                                                                        target: '/etc/sysconfig/sysstat',
                                                                                        variable: 'SADC_OPTIONS',
                                                                                        value: '-S DISK',
                                                                                      })
        end

        it do
          is_expected.to contain_shellvar('/etc/sysconfig/sysstat-ZIP').with({
                                                                               target: '/etc/sysconfig/sysstat',
                                                                               variable: 'ZIP',
                                                                               value: 'bzip2',
                                                                             })
        end
      end

      describe 'sysstat::service' do
        it do
          is_expected.to contain_service('sysstat').only_with({
                                                                enable: 'true',
                                                                name: 'sysstat',
                                                              })
        end
      end
    end
  end
end
