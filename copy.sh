#!/bin/bash

keys=(yes no error no_media_current_tab no_media_to_process_descr coapp_required coapp_required_text coapp_help coapp_installed coapp_recheck coapp_outdated dialog_audio_impossible_title dialog_audio_impossible converter_needs_reg get_conversion_license converter_reg_audio chrome_premium_required chrome_premium_hls chrome_warning_yt chrome_noyt_text3 chrome_noyt_text2 about_qr explain_qr1 not_see_again tell_me_more settings copy_settings_info_to_clipboard coapp_unchecked coapp_update coapp_not_installed coapp_install no_validate_without_coapp lic_status_verifying weh_prefs_label_downloadControlledMax mup_max_variants weh_prefs_description_contextMenuEnabled vdh_notification file_ready lic_status_unset lic_status_blocked lic_status_locked lic_mismatch2 lic_status_accepted no_license_registered)
locales=(bg ca co cs da de dsb el es fr hsb hu id is it ja ko nb nl pl pt_BR ro ru sk sl sv tr uk zh_CN zh_TW)

for locale in "${locales[@]}"; do

  # echo "" >> ./${locale}.toml
  # echo "## V9 Strings" >> ./${locale}.toml
  # echo "" >> ./${locale}.toml

  eval $(yq ./${locale}.toml -o shell)

  for key in "${keys[@]}"; do
    value=${locale}_${key}
    v9_value=${locale}_v9_${key}
    if [[ ! -n ${!v9_value} ]]; then
      if [[ -n ${!value} ]]; then
        key=v9_$key
        echo $key = \'\'\'${!value}\'\'\' >> ./${locale}.toml
      fi
    fi
  done

done
