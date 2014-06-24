#!/bin/bash

rails generate scaffold Argument \
  owner_id:integer:index \
  con_side_id:integer:index \
  con_side_essay:text \
  winner_id:integer \
  loser_id:integer \
  status:integer

