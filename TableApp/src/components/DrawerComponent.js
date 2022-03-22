import { StyleSheet, Text, View } from 'react-native'
import React from 'react'
import { DrawerContentScrollView, DrawerItem } from '@react-navigation/drawer'
import Spacer from './Spacer'

const DrawerComponent = () => {
  return (
    <View>
        <Spacer/>
        <Spacer/>
        <Spacer/>

      <Text>DrawerComponent</Text>
    </View>
  )
}

export default DrawerComponent

const styles = StyleSheet.create({})