<template>
  <div class="tiptap-editor">
    <div v-if="editor" class="toolbar">
      <button @click="editor.chain().focus().toggleBold().run()" :class="{ 'is-active': editor.isActive('bold') }">
        Bold
      </button>
      <button @click="editor.chain().focus().toggleItalic().run()" :class="{ 'is-active': editor.isActive('italic') }">
        Italic
      </button>
      <button @click="editor.chain().focus().toggleStrike().run()" :class="{ 'is-active': editor.isActive('strike') }">
        Strike
      </button>
      
      <div class="divider"></div>
      
      <label class="color-picker">
        <input
          type="color"
          @input="editor.chain().focus().setColor($event.target.value).run()"
          :value="editor.getAttributes('textStyle').color || '#000000'"
        />
        Color
      </label>

      <div class="divider"></div>

      <select @change="setFontSize($event)" :value="editor.getAttributes('textStyle').fontSize || ''">
        <option value="">Default Size</option>
        <option value="12px">12px</option>
        <option value="14px">14px</option>
        <option value="16px">16px</option>
        <option value="18px">18px</option>
        <option value="20px">20px</option>
        <option value="24px">24px</option>
        <option value="32px">32px</option>
        <option value="48px">48px</option>
      </select>
    </div>
    
    <editor-content :editor="editor" class="editor-content" />
  </div>
</template>

<script setup>
import { useEditor, EditorContent } from '@tiptap/vue-3'
import StarterKit from '@tiptap/starter-kit'
import TextStyle from '@tiptap/extension-text-style'
import Color from '@tiptap/extension-color'
import { FontSize } from '../utils/tiptapFontSize.js'
import { watch } from 'vue'

const props = defineProps({
  modelValue: {
    type: String,
    default: '',
  },
})

const emit = defineEmits(['update:modelValue'])

const editor = useEditor({
  content: props.modelValue,
  extensions: [
    StarterKit,
    TextStyle,
    Color,
    FontSize,
  ],
  onUpdate: ({ editor }) => {
    emit('update:modelValue', editor.getHTML())
  },
})

const setFontSize = (event) => {
  const size = event.target.value
  if (size) {
    editor.value.chain().focus().setFontSize(size).run()
  } else {
    editor.value.chain().focus().unsetFontSize().run()
  }
}

watch(() => props.modelValue, (value) => {
  const isSame = editor.value.getHTML() === value
  if (!isSame) {
    editor.value.commands.setContent(value, false)
  }
})
</script>

<style scoped>
.tiptap-editor {
  border: 1px solid #e0e0e0;
  border-radius: 8px;
  overflow: hidden;
  background-color: white;
  box-shadow: 0 2px 4px rgba(0,0,0,0.05);
}

.toolbar {
  display: flex;
  align-items: center;
  gap: 6px;
  padding: 8px 12px;
  background-color: #f8f9fa;
  border-bottom: 1px solid #e0e0e0;
}

.toolbar button {
  padding: 6px 12px;
  border: 1px solid transparent;
  background: transparent;
  border-radius: 4px;
  cursor: pointer;
  font-size: 14px;
  color: #333;
  transition: all 0.2s ease;
}

.toolbar button:hover {
  background-color: #e9ecef;
}

.toolbar button.is-active {
  background-color: #e2e8f0;
  font-weight: bold;
  border-color: #cbd5e1;
}

.divider {
  width: 1px;
  height: 24px;
  background-color: #cbd5e1;
  margin: 0 4px;
}

.color-picker {
  display: flex;
  align-items: center;
  gap: 6px;
  font-size: 14px;
  color: #333;
  cursor: pointer;
}

.color-picker input {
  cursor: pointer;
  border: none;
  background: none;
  width: 24px;
  height: 24px;
  padding: 0;
}

select {
  padding: 6px 8px;
  border: 1px solid #cbd5e1;
  border-radius: 4px;
  background-color: white;
  font-size: 14px;
  cursor: pointer;
}

.editor-content {
  padding: 16px;
  min-height: 300px;
  font-family: inherit;
}

/* Tiptap removes outline automatically, but we ensure prose styling */
:deep(.ProseMirror) {
  outline: none;
}
:deep(.ProseMirror p) {
  margin-top: 0;
}
</style>
