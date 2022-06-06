<script type="text/x-template" id="item-template">
    <li>
        <!-- 클릭, 더블클릭 이벤트 선언 -->
        <!-- 하위 메뉴 존재 여부에 따라 클래스 추가와 블릿 표시 -->
        <div
            :class="{bold : isFolder}"
            @click="toggle"
            @dblclick="makeFolder">
            {{ item.name }}
            <span v-if="isFolder">[{{ isOpen ? '-' : '+' }}]</span>
        </div>
        <!-- 하위 메뉴가 존재할시 표시하지만 숨김처리 -->
        <ul v-show="isOpen" v-if="isFolder">
            <!-- 템플릿 재귀 호출-->
            <!-- 호출할 커스텀 이벤트 선언 -->
            <tree-item
                class="item"
                v-for="(child,index) in item.children"
                :key="index"
                :item="child"
                @make-folder="$emit('make-folder', $event)"
                @add-item="$emit('add-item', $event)"
            >
            </tree-item>
            <!-- 아이템 추가시 emit으로 상위 이벤트 호출 -->
            <li class="add" @click="$emit('add-item', item)">+</li>
        </ul>
    </li>
</script>
<p>(You can double click on an item to turn it into a folder.)</p>

<!-- 템플릿 호출, 커스텀 이벤트 정의 -->
<ul id="demo">
    <tree-item
        class="item"
        :item="treeData"
        @make-folder="makeFolder"
        @add-item="addItem"
    >
    </tree-item>
</ul>