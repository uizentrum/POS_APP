import { StyleSheet, Text, View, TouchableOpacity } from 'react-native'
import React from 'react'


const NavigationText = ({text, onPress}) => {
  return (
    <View>
        <TouchableOpacity onPress={onPress}>
        <Text style={styles.text}>{text}</Text>
        </TouchableOpacity>

    </View>
  )
}

export default NavigationText

const styles = StyleSheet.create({
    text:{
        color:'blue'
    }
})