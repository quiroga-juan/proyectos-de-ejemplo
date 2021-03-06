#!/usr/bin/env ruby
#
# Objetivos
# * Crear directorios y establecer permisos
# * Código limpio y ordenado

require 'rainbow'

def create_dirs
  if File.exist? 'private'
    puts "[WARN] Directorio private ya existe!"
  else
    system('mkdir private')
    system('chmod 755 private')
  end

  if File.exist?('group')
    puts "[WARN] Directorio group ya existe!"
  else
    system('mkdir group')
    system('chmod 750 group')
  end

  if File.exist? 'public'
    puts "[WARN] Directorio public ya existe!"
  else
    system('mkdir public')
    system('chmod 755 public')
  end
end

def show_title
  puts "="*40
  puts "Ejecutando el programa #{Rainbow($0).yellow.bright}"
  puts "="*40
end

show_title
create_dirs
