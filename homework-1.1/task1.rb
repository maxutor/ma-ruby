inputed_timezone = ARGV[0]
SECONDS_PER_HOUR = 3600

TIMEZONES_OFFSET = {
  'VLAT' => 10,
  'TFT' => 5,
  'EEST' => 3,
  'EGT' => -1,
  'BRST'=> -2,
  'UTC' => 0
}

utc_time = Time.now.utc
offset = TIMEZONES_OFFSET[inputed_timezone]
p utc_time + offset * SECONDS_PER_HOUR
