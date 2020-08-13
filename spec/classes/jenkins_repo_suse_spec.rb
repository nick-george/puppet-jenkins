require 'spec_helper'

describe 'jenkins' do
  on_supported_os(supported_os: [{ 'operatingsystem' => 'OpenSuSE' }]).each do |os, os_facts|
    context "on #{os}" do
      let(:facts) { os_facts }

      context 'repo::suse' do
        describe 'default' do
          it { is_expected.to contain_zypprepo('jenkins').with_baseurl('https://pkg.jenkins.io/opensuse-stable/') }
        end

        describe 'lts = true' do
          let(:params) { { lts: true } }

          it { is_expected.to contain_zypprepo('jenkins').with_baseurl('https://pkg.jenkins.io/opensuse-stable/') }
        end

        describe 'lts = false' do
          let(:params) { { lts: false } }

          it { is_expected.to contain_zypprepo('jenkins').with_baseurl('https://pkg.jenkins.io/opensuse/') }
        end
      end
    end
  end
end
