#!/bin/bash
ss -ato state established
sleep 30
ss -ato state established